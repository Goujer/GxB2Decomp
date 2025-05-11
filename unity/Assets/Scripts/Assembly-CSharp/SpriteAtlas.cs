using System;
using System.Collections.Generic;
using UnityEngine;

[Serializable]
public class SpriteAtlas
{
	public Material material;

	public Material clipMaterial;

	public List<Sprite> mSprites;

	private Material _material;

	private Material _clipMaterial;

	private Dictionary<string, int> mSpriteIndices;

	public Material GetMaterial()
	{
		return null;
	}

	public Material GetClipMaterial()
	{
		return null;
	}

	public Sprite GetSprite(string name)
	{
		return null;
	}

	public void Init(ref Dictionary<string, int> dict, int index)
	{
	}
}
