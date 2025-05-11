using System.Collections.Generic;
using UnityEngine;

public class GravityControl : MonoBehaviour
{
	public float gravityX;

	public float gravityY;

	public float gravityZ;

	public float fiedX;

	public float fiedY;

	public float fiedZ;

	public float sensitivity;

	public float[] partsSpd;

	public List<Transform> parts;

	public List<Vector3> partsPosition;

	public Vector3 gravity;

	public Vector3 gravityCoe;

	private float time;

	private void Start()
	{
	}

	private void FixedUpdate()
	{
	}

	private void Update()
	{
	}
}
