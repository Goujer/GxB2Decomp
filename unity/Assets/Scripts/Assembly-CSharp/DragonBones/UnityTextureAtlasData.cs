using UnityEngine;

namespace DragonBones
{
	public class UnityTextureAtlasData : TextureAtlasData
	{
		internal bool _disposeEnabled;

		public Material texture;

		public Material uiTexture;

		protected override void _OnClear()
		{
		}

		public override TextureData CreateTexture()
		{
			return null;
		}
	}
}
