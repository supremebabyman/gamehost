/*
	Retro Palette Swapper (for GX.GAMES) v1.2
	Which should detect a Masking Color from a given Sprite, and replace it with Colors from a Palette Texture, or replace it with a Texture, depending on pattern_enabled
	
	RPS made by Pixelated Pope
	GX.GAMES Compatible Version (for Pizza Tower) by burnedpopcorn180
	
	This is based off of Pixelated Pope's shd_pal_html_sprite, but this shader has been modified for Pizza Tower, as:
	
	- Palette Variables are Compatible with Pizza Tower's RPS System without needing any further Modifications within the Game's Code
	- Pattern Support has been added to allow for Pizza Tower's Patterns
	
	This Shader should just be a drop-in replacement for the original shd_pal_swapper in Pizza Tower, so yeah
	This is also compatible on ANY Platform, including Windows, so...
	For the best experience, turn of "Interpolate colours between pixels" option for GX.GAMES
	
	also special thanks to ygxa
	for the proof of concept
*/

//********SETUP*********

// This one is specific to your project
// Check Game Options for this
// Although this is the standard value
#define TexturePageSize 2048. 

#define ColorCount 64. 
#define PixelSize 1./TexturePageSize
#define PalHeight ColorCount * PixelSize
#define Transparent vec4(.0,.0,.0,.0)
#define Tolerance 0.004

varying vec2 v_vTexcoord;				// Standard
varying vec4 v_vColour;					//		Stuff

//**********************

// Palettes
uniform sampler2D palette_texture;		// Palette Texture
uniform vec4 palette_UVs;				// Palette Texture UV Coordinates
uniform float palette_index;			// Palette Texture Color Coordinates
uniform vec2 texel_size;				// Pixel Size

// Patterns
uniform sampler2D pattern_texture;		// Pattern Texture
uniform int pattern_enabled;			// If == 1, use Patterns
uniform vec4 pattern_tex_data;			// Pattern Texture Size, (x, y) = trimmed l/t offset | (z, w) = texture size
uniform vec4 pattern_UVs;				// Pattern UV Coords, aka Pattern Sprite Corner Coords

// GameMaker Sprite
uniform vec4 sprite_UVs;				// Sprite UV Coords, aka Sprite Texture Corner Coords
uniform vec4 sprite_tex_data;			// Sprite Texture Size, (x, y) = trimmed l/t offset | (z, w) = texture size

// UNUSED
uniform vec2 sprite_scale;				// (xscale, yscale)			(UNUSED IN THIS SHADER)
uniform int pattern_solid_color;		//							(UNUSED IN THIS SHADER)
uniform float color_array[2];			//							(UNUSED IN THIS SHADER)

// MAIN STUFF ------------------------------------------------------------------------------------------------------------------------------------

// Function to apply Palettes and Patterns to a Given GM Sprite
vec4 pal_func(vec4 inCol, vec2 corner)
{
	// If a Pixel on Sprite is Transparent, Keep it Transparent and stop there
    if (inCol.a == 0.0) return Transparent;

	// Variables
    float dist;
    vec2 testPos;
    vec4 leftCol;
    
    // Check Every Pixel for Mask Color (That the Palette or Pattern will be Applied to)
    for (float i = 0.0; i < PalHeight; i += PixelSize)
    {
		// test position
		testPos = vec2(corner.x, corner.y + i);
		leftCol = texture2D(palette_texture, testPos);
		// Determines how close the Colors are to Masking Color
		dist = distance(leftCol, inCol);
		// If Colors on Pixel are Similar enough to Masking Color, Apply Palette or Pattern
        if (dist <= Tolerance)
        {
            // Position of Mask Color
			testPos = vec2(corner.x + texel_size.x * floor(palette_index + 1.0), corner.y + i);
			// Apply Palette Color onto Mask Color
			inCol = mix(texture2D(palette_texture, vec2(testPos.x - texel_size.x, testPos.y)), texture2D(palette_texture, testPos), fract(palette_index));
			
            // If Pattern is being Used, Apply Pattern
            if (pattern_enabled == 1)
            {
                // Pattern Position Logic
				// Most of this is just from PT's shd_pal_swapper, but its a bit different
                vec2 pos = (v_vTexcoord - sprite_UVs.xy) * sprite_tex_data.zw;
                vec2 edge = (pattern_UVs.zw - pattern_UVs.xy) * pattern_tex_data.zw;
                pos = mod(pos + sprite_tex_data.xy, edge + pattern_tex_data.xy);
                pos = pos / pattern_tex_data.zw;
                vec2 texcoord = pattern_UVs.xy + pos;
                // Sample the pattern texture using the final UVs
                vec4 pat = texture2D(pattern_texture, texcoord);
                // Only mix if the Pattern isn't Transparent
                if (pat.a > 0.0)
                {
                    // Mix the Pattern texture with Sprite
                    inCol = mix(pat, inCol, inCol.a);
                }
            }
			// return Palette or Pattern, depending on if Patterns were being used
            return inCol;
        }
    }
    
    // If Masking Color wasn't found, return normal Sprite
    return inCol;
}

void main()
{
    // GameMaker Sprite
    vec4 col = texture2D(gm_BaseTexture, v_vTexcoord);
    DoAlphaTest(col);
    // Check for Masking Color and Apply Palettes or Patterns
    col = pal_func(col, palette_UVs.xy);
	// Truely Apply Palette Colors or Pattern Texture to Sprite
    gl_FragColor = v_vColour * col;
}