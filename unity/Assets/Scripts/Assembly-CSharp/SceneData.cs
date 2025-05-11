using System;
using UnityEngine;

[Serializable]
public class SceneData : ScriptableObject
{
	public bool Fog;

	public Color FogColor;

	public Color AmbientLight;

	public float FogDensity;

	public FogMode FogMode;

	public float FogStartDistance;

	public float FogEndDistance;

	public Texture2D[] LightmapColors;

	public LightProbes LightProbes;

	public Color BackgroundColor;

	public RendererRef[] RendererRefs;

	public void SetData(Texture2D[] lightmapColors, LightProbes lightProbes, RendererRef[] rendererRefs)
	{
	}

	public void Release()
	{
	}
}
