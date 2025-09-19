// Colour pixel/fragment shader
// Basic fragment shader outputting a colour

struct InputType
{
	float4 position : SV_POSITION;
	//float4 colour : COLOR;
    float2 tex : TEXCOORD0;	// Have to name it tex as naming it texture doesn't work. Why?
};


float4 main(InputType input) : SV_TARGET
{
	//return input.colour;
    return float4((1.f * input.tex.x), (1.f * input.tex.x), (1.f * input.tex.x), 1.f); // Task 6: use the pixel shader to override the colour so the triangle is red
}