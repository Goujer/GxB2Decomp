using System;
using UnityEngine;

[Serializable]
public class ProjectorEyeTexture
{
	private RenderTexture _RenderTexture;

	private Camera _Camera;

	public ProjectorEyeTexture(Camera camera, int size)
	{
	}

	public void CleanUp()
	{
	}

	public void setCustomShader(bool isEnable)
	{
	}

	public Texture GetTexture()
	{
		return null;
	}

	public RenderTexture GetRenderTexture()
	{
		return null;
	}
}
