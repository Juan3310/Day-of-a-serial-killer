shader_type canvas_item; 

uniform bool inversion = false;

void vertex() {
}

void fragment() {
	if (COLOR.a == 0.0) {
		discard;
	}
	
	if (inversion == true) {
		if (distance(COLOR.rgb, vec3(1, 0.556862, 0.262745)) < 0.1) {
			COLOR = vec4(0.129411, 0.121568, 0.203921, 1.0);
		}
		else {
			COLOR = vec4(1, 0.556862, 0.262745, 1.0);
		}
	}
	else {
		COLOR = texture(TEXTURE, UV);
	}
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
