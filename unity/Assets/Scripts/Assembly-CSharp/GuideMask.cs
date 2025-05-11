using System.Collections.Generic;
using System.Runtime.InteropServices;
using UnityEngine;

public class GuideMask : MonoBehaviour
{
	public struct MaskInfo
	{
		public int X;

		public int Y;

		public Texture mTexture;

		public UISprite mUISprite;

		public MaskInfo(int x, int y, Texture texture)
		{
			X = 0;
			Y = 0;
			mTexture = null;
			mUISprite = null;
		}

		public MaskInfo(int x, int y, UISprite sprite)
		{
			X = 0;
			Y = 0;
			mTexture = null;
			mUISprite = null;
		}
	}

	[StructLayout(LayoutKind.Sequential, Size = 8)]
	public struct AlphaPos
	{
		public int X;

		public int Y;

		public AlphaPos(int x, int y)
		{
			X = 0;
			Y = 0;
		}
	}

	public List<MaskInfo> masks;

	public List<MaskInfo> maskSprites;

	public Texture2D mTexture;

	public List<AlphaPos> alphaPos;

	public Color defaultColor;

	public Color alphaColor;

	public void DrawSpriteMask()
	{
	}

	public void CleanAlphaPos()
	{
	}

	public void InitTexture()
	{
	}

	public bool CheckSpritePixel(int x, int y)
	{
		return false;
	}

	public bool CheckSingleSpritePixel(MaskInfo mMask, int x, int y)
	{
		return false;
	}

	public void AddMask(int x, int y, UISprite sprite)
	{
	}

	public void ClearMask()
	{
	}

	public void AddMask(int x, int y, Texture texture)
	{
	}

	public void AddMask(MaskInfo mMask)
	{
	}

	public void DrawMask()
	{
	}

	public bool CheckPixel(int x, int y)
	{
		return false;
	}

	public bool CheckSinglePixel(MaskInfo mMask, int x, int y)
	{
		return false;
	}

	public void SetDefaultColor(float r, float g, float b, float a)
	{
	}
}
