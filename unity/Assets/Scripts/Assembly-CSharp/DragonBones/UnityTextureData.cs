using System.Collections.Generic;
using UnityEngine;

namespace DragonBones
{
	internal class UnityTextureData : TextureData
	{
		public const string SHADER_PATH = "Shaders/";

		public const string SHADER_GRAP = "DB_BlendMode_Grab";

		public const string SHADER_FRAME_BUFFER = "DB_BlendMode_Framebuffer";

		public const string UI_SHADER_GRAP = "DB_BlendMode_UIGrab";

		public const string UI_SHADER_FRAME_BUFFER = "DB_BlendMode_UIFramebuffer";

		internal Dictionary<string, Material> _cacheBlendModeMats;

		protected override void _OnClear()
		{
		}

		private Material _GetMaterial(BlendMode blendMode)
		{
			return null;
		}

		private Material _GetUIMaterial(BlendMode blendMode)
		{
			return null;
		}

		internal Material GetMaterial(BlendMode blendMode, bool isUGUI = false)
		{
			return null;
		}

		public override void CopyFrom(TextureData value)
		{
		}
	}
}
