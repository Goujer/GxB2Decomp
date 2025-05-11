using System;
using UnityEngine;

namespace DragonBones
{
	[Serializable]
	public class UnityDragonBonesData : ScriptableObject
	{
		[Serializable]
		public class TextureAtlas
		{
			public TextAsset textureAtlasJSON;

			public Texture2D texture;

			public Material material;

			public Material uiMaterial;
		}

		public string dataName;

		public TextAsset dragonBonesJSON;

		public TextureAtlas[] textureAtlas;

		public void RemoveFromFactory(bool disposeData = true)
		{
		}
	}
}
