using LuaInterface;
using UnityEngine;

public class WarCamera : MonoBehaviour
{
	public Vector3 InitOffset;

	public int AngleXMin;

	public int AngleXMax;

	public int HeightMin;

	public int HeightMax;

	public int CameraAngleY1;

	public int CameraAngleY2;

	public float Margin;

	public string[] layers;

	public float MoveSpeedMin;

	public float MoveSpeedMax;

	public float MoveMagnitudeMin;

	public float MoveMagnitudeMax;

	public float HeightMoveSpeed;

	public float FieldOfView;

	public float FarClipPlane;

	private Camera mCamera;

	private float mAngleY;

	private float mCameraHeight;

	private Vector3 mCenterPosition;

	private bool mShaking;

	private float mShakingTimer;

	private void Start()
	{
	}

	private void OnDestroy()
	{
	}

	public void CreateCamera()
	{
	}

	public void InitCamera(LuaTable luaTable, bool isWeSide)
	{
	}

	public void UpdateCamera(LuaTable luaTable)
	{
	}

	public void Shake(bool value)
	{
	}

	public Camera GetCamera()
	{
		return null;
	}

	public Vector3 GetPosition()
	{
		return default(Vector3);
	}
}
