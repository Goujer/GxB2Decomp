using System.Collections.Generic;

namespace DragonBones
{
	public abstract class TextureAtlasData : BaseObject
	{
		public bool autoSearch;

		public uint width;

		public uint height;

		public float scale;

		public string name;

		public string imagePath;

		public readonly Dictionary<string, TextureData> textures;

		public TextureAtlasData()
		{
		}

		protected override void _OnClear()
		{
		}

		public void CopyFrom(TextureAtlasData value)
		{
		}

		public abstract TextureData CreateTexture();

		public void AddTexture(TextureData value)
		{
		}

		public TextureData GetTexture(string name)
		{
			return null;
		}
	}
}
