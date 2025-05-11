using UnityEngine;

namespace Spine.Unity
{
	public class AtlasAsset : ScriptableObject
	{
		public TextAsset atlasFile;

		public Material[] materials;

		protected Atlas atlas;

		public bool IsLoaded
		{
			get
			{
				return false;
			}
		}

		public static AtlasAsset CreateRuntimeInstance(TextAsset atlasText, Material[] materials, bool initialize)
		{
			return null;
		}

		public static AtlasAsset CreateRuntimeInstance(TextAsset atlasText, Texture2D[] textures, Material materialPropertySource, bool initialize)
		{
			return null;
		}

		public static AtlasAsset CreateRuntimeInstance(TextAsset atlasText, Texture2D[] textures, Shader shader, bool initialize)
		{
			return null;
		}

		private void Reset()
		{
		}

		public virtual void Clear()
		{
		}

		public virtual Atlas GetAtlas()
		{
			return null;
		}

		public Mesh GenerateMesh(string name, Mesh mesh, out Material material, float scale = 0.01f)
		{
			material = null;
			return null;
		}
	}
}
