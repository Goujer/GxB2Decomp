using UnityEngine;

namespace Spine.Unity
{
	public class MaterialsTextureLoader : TextureLoader
	{
		private AtlasAsset atlasAsset;

		public MaterialsTextureLoader(AtlasAsset atlasAsset)
		{
		}

		public void Load(AtlasPage page, string path)
		{
		}

		private bool CheckMat(Material material, string name)
		{
			return false;
		}

		public void Unload(object texture)
		{
		}
	}
}
