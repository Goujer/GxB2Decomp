using System.Collections.Generic;
using UnityEngine;

public class GuideTexture : MonoBehaviour
{
	public Texture2D texture;

	public Texture2D stampTexture;

	public int scale;

	private List<Vector4> rects;

	private List<Vector3> circles;

	private Color transparent;

	private Color opaque;

	private void Start()
	{
	}

	public void AddRect(Vector4 rect)
	{
	}

	public void AddCircle(Vector3 circle)
	{
	}

	public void Draw()
	{
	}

	public void ClearRects()
	{
	}

	public void ClearCircles()
	{
	}

	private bool checkRects(int x, int y)
	{
		return false;
	}

	private bool checkCircles(int x, int y)
	{
		return false;
	}
}
