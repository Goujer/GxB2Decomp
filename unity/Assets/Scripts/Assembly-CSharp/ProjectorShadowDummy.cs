using UnityEngine;

public class ProjectorShadowDummy : MonoBehaviour
{
	public Vector3 _ShadowLocalOffset;

	public Quaternion _RotationAngleOffset;

	public bool _freezeXRot;

	public bool _freezeYRot;

	public bool _freezeZRot;

	private Quaternion _AngleOffset;

	public void OnPreRenderShadowDummy(Camera camera)
	{
	}
}
