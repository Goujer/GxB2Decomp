using UnityEngine;

[ExecuteInEditMode]
public class GreyEffect : MonoBehaviour
{
	public Shader curShader;

	private float grayScaleAmount;

	private Material curMaterial;

	private Material material
	{
		get
		{
			return null;
		}
	}

	private void Start()
	{
	}

	private void OnRenderImage(RenderTexture source, RenderTexture destination)
	{
	}

	private void OnDisable()
	{
	}
}
