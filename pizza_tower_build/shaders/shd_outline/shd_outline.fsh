precision mediump float;  // for webgl

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 size;
uniform vec3 oColor;
uniform vec4 uvs;

const float rad_circle = 6.28319;

void main()
{
    vec4 col = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
    gl_FragColor = vec4(col.rgb * col.a, col.a);
    
    bool outline = false;
    float alpha = v_vColour.a;

    // all this shit to avoid dynamic loop bullshit
    float offset1 = 1.0;
    float offset2 = 2.0;
    float offset3 = 3.0;
    float offset4 = 4.0;

    vec2 check_pos_1 = v_vTexcoord + vec2(cos(offset1 * rad_circle / 4.0) * size.x, -sin(offset1 * rad_circle / 4.0) * size.y);
    vec2 check_pos_2 = v_vTexcoord + vec2(cos(offset2 * rad_circle / 4.0) * size.x, -sin(offset2 * rad_circle / 4.0) * size.y);
    vec2 check_pos_3 = v_vTexcoord + vec2(cos(offset3 * rad_circle / 4.0) * size.x, -sin(offset3 * rad_circle / 4.0) * size.y);
    vec2 check_pos_4 = v_vTexcoord + vec2(cos(offset4 * rad_circle / 4.0) * size.x, -sin(offset4 * rad_circle / 4.0) * size.y);

    bool out_bound_1 = check_pos_1.x < uvs.r || check_pos_1.y < uvs.g || check_pos_1.x > uvs.b || check_pos_1.y > uvs.a;
    bool out_bound_2 = check_pos_2.x < uvs.r || check_pos_2.y < uvs.g || check_pos_2.x > uvs.b || check_pos_2.y > uvs.a;
    bool out_bound_3 = check_pos_3.x < uvs.r || check_pos_3.y < uvs.g || check_pos_3.x > uvs.b || check_pos_3.y > uvs.a;
    bool out_bound_4 = check_pos_4.x < uvs.r || check_pos_4.y < uvs.g || check_pos_4.x > uvs.b || check_pos_4.y > uvs.a;

    vec4 datPixel1 = v_vColour * texture2D(gm_BaseTexture, check_pos_1);
    vec4 datPixel2 = v_vColour * texture2D(gm_BaseTexture, check_pos_2);
    vec4 datPixel3 = v_vColour * texture2D(gm_BaseTexture, check_pos_3);
    vec4 datPixel4 = v_vColour * texture2D(gm_BaseTexture, check_pos_4);
    
    if ((datPixel1.a > 0.0 && !out_bound_1) ||
        (datPixel2.a > 0.0 && !out_bound_2) ||
        (datPixel3.a > 0.0 && !out_bound_3) ||
        (datPixel4.a > 0.0 && !out_bound_4)) {
        outline = true;
        alpha = max(alpha, max(datPixel1.a, max(datPixel2.a, max(datPixel3.a, datPixel4.a))));
    }

    if (outline) {
        gl_FragColor = vec4(oColor.r, oColor.g, oColor.b, alpha);
    }
}

