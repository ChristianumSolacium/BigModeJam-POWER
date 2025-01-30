shader_type canvas_item;

uniform float blur_strength : hint_range(0.0, 1.0) = 0.1;

uniform int samples : hint_range(1, 100) = 3; // Number of blur passes
uniform int directions : hint_range(1, 16) = 10; // Number of blur directions
uniform int dist : hint_range(2,100) = 3;
void fragment() {
    vec2 uv = UV;
    vec4 sum = texture(TEXTURE, uv); // Start with the base texture sample
    for (int k = 1; k < 9; k++){
		float angle = 2.0 * PI * float(k) / 9.0;
		vec2 offset = vec2(cos(angle), sin(angle));
		vec4 color = texture(TEXTURE,uv + offset);
		if (color.a > 0.0){
			COLOR = color;
		}
	}
	for (int k = 1; k <= dist; k ++){
	    for (int i = 1; i <= samples; i++) {
	        float t = float(i) / float(samples); // Gradual intensity factor
	        
	        for (int j = 0; j < directions; j++) {
	            float angle = 2.0 * PI * float(j) / float(directions); // Spread samples in a circle
	            vec2 offset = float(dist - k) *  vec2(cos(angle), sin(angle)) * t * pow(blur_strength / float(samples),1.1);
	            
	            sum += texture(TEXTURE, uv + offset);
	            sum += texture(TEXTURE, uv - offset);
	        }
	    }
    }
    COLOR = sum / float(1 + samples * 2 * directions * dist); // Normalize the result
	COLOR = sqrt(COLOR);
}
