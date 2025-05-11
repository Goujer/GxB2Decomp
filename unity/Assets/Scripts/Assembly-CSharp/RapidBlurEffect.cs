using UnityEngine;

[ExecuteInEditMode]
public class RapidBlurEffect : MonoBehaviour
{
	private string ShaderName;

	public Shader CurShader;

	private Material CurMaterial;

	public bool ShouldMoveCamera;

	public Vector3 CameraMovePosDelta;

	public int DownSampleNum;

	public float BlurSpreadSize;

	public int BlurIterations;

	private bool startBlur;

	private bool cameraMoved;

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

	public void OnRenderImage(RenderTexture sourceTexture, RenderTexture destTexture)
	{
	}

	private void OnDisable()
	{
	}

	private void OnEnable()
	{
	}

	public void DisableCameraRender()
	{
	}

	public void EnableCameraRender()
	{
	}

	private void MoveCamera(Vector3 delta)
	{
	}
}
