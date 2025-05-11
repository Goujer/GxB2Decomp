using LuaInterface;
using UnityEngine;

public class BattleCamera : MonoBehaviour
{
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

	private Vector3 mOffset;

	private void Start()
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

	public Camera GetCamera()
	{
		return null;
	}

	public Vector3 GetPosition()
	{
		return default(Vector3);
	}
}
