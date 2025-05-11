using System.Runtime.InteropServices;
using UnityEngine;
using UnityEngine.UI;

public class Radar : MonoBehaviour
{
	[StructLayout(LayoutKind.Sequential, Size = 40)]
	public struct RadarInfo
	{
		public float[] Total;

		public float[] Score;

		public int Side;

		public Color FillColor;

		public RadarInfo(float[] total, float[] score, int side, Color fillColor)
		{
			Total = null;
			Score = null;
			Side = 0;
			FillColor = default(Color);
		}
	}

	private int VERTICES_COUNT;

	public Vector3[] vertices;

	public Vector2[] uvs;

	private VertexHelper vertexhelper;

	private Vector4 m_clipArea;

	private Vector3 oldPosition;

	private RadarInfo radarInfo;

	private int[] triangles;

	public UIWidget parent;

	public MeshRenderer meshrenderer;

	private MeshFilter meshFilter;

	private Mesh mesh;

	public Color color;

	private void Awake()
	{
	}

	private Vector4 calClipArea(UIPanel panel)
	{
		return default(Vector4);
	}

	public void SetInfo(float[] total, float[] score, int side, Color fillColor, UIWidget parent)
	{
	}

	public void SetQueue()
	{
	}

	private void CalculateVertices()
	{
	}

	private void CreateMesh()
	{
	}

	private void Apply()
	{
	}

	private void Update()
	{
	}
}
