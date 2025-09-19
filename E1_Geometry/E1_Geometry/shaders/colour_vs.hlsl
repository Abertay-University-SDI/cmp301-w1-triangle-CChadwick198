// colour vertex shader
// Simple geometry pass
// texture coordinates and normals will be ignored.

cbuffer MatrixBuffer : register(b0)
{
	matrix worldMatrix;
	matrix viewMatrix;
	matrix projectionMatrix;
};

struct InputType
{
	float4 position : POSITION;
	//float4 colour : COLOR;
    float2 tex : TEXCOORD0;
};

struct OutputType
{
	float4 position : SV_POSITION;
	//float4 colour : COLOR;
    float2 tex : TEXCOORD0;
};

OutputType main(InputType input)
{
	OutputType output;
	
	// Change the position vector to be 4 units for proper matrix calculations.
	input.position.w = 1.0f;
	// Task 7: manipulate vertex positions to be twice the original size
    input.position.x *= 2;
    input.position.y *= 2;
    input.position.z *= 2;
	
	// Calculate the position of the vertex against the world, view, and projection matrices.
	output.position = mul(input.position, worldMatrix);
	output.position = mul(output.position, viewMatrix);
	output.position = mul(output.position, projectionMatrix);

	//output.colour = input.colour;
	
    output.tex = input.tex;
    //output.colour = float4(1.f, 1.f, 1.f, 1.f);

	return output;
}