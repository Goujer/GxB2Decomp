Shader "Custom/Skeleton Fill" {
	Properties {
		_FillColor ("FillColor", Vector) = (1,1,1,1)
		_FillPhase ("FillPhase", Range(0, 1)) = 0
		_ClipRange0 ("ClipRange0", Vector) = (0,0,1,1)
		_ClipArgs0 ("ClipArgs", Vector) = (1000,1000,0,0)
		_ClipRadius ("ClipRadius", Float) = 0
		_ClipCenter ("ClipCenter", Vector) = (0.5,0.5,0,0)
		[NoScaleOffset] _MainTex ("MainTex", 2D) = "white" {}
		[NoScaleOffset] _AlphaTex ("alpha tex", 2D) = "white" {}
		[NoScaleOffset] _MainTex2 ("MainTex2", 2D) = "white" {}
		[NoScaleOffset] _AlphaTex2 ("alpha tex2", 2D) = "white" {}
		[NoScaleOffset] _MainTex3 ("MainTex3", 2D) = "white" {}
		[NoScaleOffset] _AlphaTex3 ("alpha tex3", 2D) = "white" {}
		[NoScaleOffset] _MainTex4 ("MainTex4", 2D) = "white" {}
		[NoScaleOffset] _AlphaTex4 ("alpha tex4", 2D) = "white" {}
	}
	//DummyShaderTextExporter
	SubShader{
		Tags { "RenderType"="Opaque" }
		LOD 200

		Pass
		{
			HLSLPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			float4x4 unity_MatrixMVP;

			struct Vertex_Stage_Input
			{
				float3 pos : POSITION;
			};

			struct Vertex_Stage_Output
			{
				float4 pos : SV_POSITION;
			};

			Vertex_Stage_Output vert(Vertex_Stage_Input input)
			{
				Vertex_Stage_Output output;
				output.pos = mul(unity_MatrixMVP, float4(input.pos, 1.0));
				return output;
			}

			Texture2D<float4> _MainTex;
			SamplerState _MainTex_sampler;

			struct Fragment_Stage_Input
			{
				float2 uv : TEXCOORD0;
			};

			float4 frag(Fragment_Stage_Input input) : SV_TARGET
			{
				return _MainTex.Sample(_MainTex_sampler, float2(input.uv.x, input.uv.y));
			}

			ENDHLSL
		}
	}
	Fallback "Diffuse"
}