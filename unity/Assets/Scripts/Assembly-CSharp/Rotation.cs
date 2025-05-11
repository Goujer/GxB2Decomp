using UnityEngine;

public class Rotation : MonoBehaviour
{
	public enum RotationAxis
	{
		All = 0,
		Y = 1,
		X = 2,
		Z = 3
	}

	public RotationAxis axis;

	public float speedRot;

	private void Update()
	{
	}
}
