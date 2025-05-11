using System;
using UnityEngine;

[Serializable]
public class BMSymbol
{
	public string sequence;

	public string spriteName;

	private UISpriteData mSprite;

	private bool mIsValid;

	public float defaultSize;

	private float mScale;

	private int oldFontSize;

	private int mLength;

	private int mOffsetX;

	private int mOffsetY;

	private int mWidth;

	private int mHeight;

	private int mAdvance;

	private Rect mUV;

	public int length
	{
		get
		{
			return 0;
		}
	}

	public int offsetX
	{
		get
		{
			return 0;
		}
	}

	public int offsetY
	{
		get
		{
			return 0;
		}
	}

	public int width
	{
		get
		{
			return 0;
		}
	}

	public int height
	{
		get
		{
			return 0;
		}
	}

	public int advance
	{
		get
		{
			return 0;
		}
	}

	public Rect uvRect
	{
		get
		{
			return default(Rect);
		}
	}

	public void MarkAsChanged()
	{
	}

	public bool Validate(UIAtlas atlas)
	{
		return false;
	}

	public float scale(int fontSize)
	{
		return 0f;
	}
}
