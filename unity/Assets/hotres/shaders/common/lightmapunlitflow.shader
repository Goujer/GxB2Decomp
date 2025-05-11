Shader "NF/Scene/Unlit Flow (Supports Lightmap)" {
	Properties {
		_MainColor ("Main Color", Vector) = (1,1,1,1)
		_LightDir ("Light Direction", Vector) = (0,-1,-1,1)
		_Normal ("Normal", 2D) = "white" {}
		_DirectionX ("Flow Direction X", Range(0, 1)) = 0
		_DirectionY ("Flow Direction Y", Range(0, 1)) = 0
		_FlowSpeed ("Flow Speed", Float) = 0
		_Gloss ("Gloss", Float) = 3
		_SpecularScale ("Specular Scale", Float) = 1
		_NoiseOffset ("Noise Offset", Vector) = (0,0,0,0)
		[KeywordEnum(OCEAN, WAVE)] WaterModel ("Water Mode", Float) = 0
	}
	//DummyShaderTextExporter
	SubShader{
		Tags { "RenderType" = "Opaque" }
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

			float4 frag(Vertex_Stage_Output input) : SV_TARGET
			{
				return float4(1.0, 1.0, 1.0, 1.0); // RGBA
			}

			ENDHLSL
		}
	}
}