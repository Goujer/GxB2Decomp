using System;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class UITexture : UIBasicSprite
{
	[HideInInspector]
	[SerializeField]
	private Rect mRect;

	[HideInInspector]
	[SerializeField]
	private Texture mTexture;

	[HideInInspector]
	[SerializeField]
	private Shader mShader;

	[HideInInspector]
	[SerializeField]
	private Vector4 mBorder;

	[HideInInspector]
	[SerializeField]
	private bool mFixedAspect;

	[NonSerialized]
	private int mPMA;

	public override Texture mainTexture
	{
		get
		{
			return null;
		}
		set
		{
		}
	}

	public override Material material
	{
		get
		{
			return null;
		}
		set
		{
		}
	}

	public override Shader shader
	{
		get
		{
			return null;
		}
		set
		{
		}
	}

	public override bool premultipliedAlpha
	{
		get
		{
			return false;
		}
	}

	public override Vector4 border
	{
		get
		{
			return default(Vector4);
		}
		set
		{
		}
	}

	public Rect uvRect
	{
		get
		{
			return default(Rect);
		}
		set
		{
		}
	}

	public override Vector4 drawingDimensions
	{
		get
		{
			return default(Vector4);
		}
	}

	public bool fixedAspect
	{
		get
		{
			return false;
		}
		set
		{
		}
	}

	public override void MakePixelPerfect()
	{
	}

	protected override void OnUpdate()
	{
	}

	public override void OnFill(List<Vector3> verts, List<Vector2> uvs, List<Color> cols)
	{
	}
}
