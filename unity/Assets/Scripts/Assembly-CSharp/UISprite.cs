using System;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class UISprite : UIBasicSprite
{
	[HideInInspector]
	[SerializeField]
	private UIAtlas mAtlas;

	[HideInInspector]
	[SerializeField]
	private string mSpriteName;

	[HideInInspector]
	[SerializeField]
	private bool mFillCenter;

	[NonSerialized]
	protected UISpriteData mSprite;

	[NonSerialized]
	private bool mSpriteSet;

	public bool isOffset;

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

	public UIAtlas atlas
	{
		get
		{
			return null;
		}
		set
		{
		}
	}

	public OffsetType offsetType
	{
		get
		{
			return default(OffsetType);
		}
		set
		{
		}
	}

	public string spriteName
	{
		get
		{
			return null;
		}
		set
		{
		}
	}

	public bool isValid
	{
		get
		{
			return false;
		}
	}

	[Obsolete]
	public bool fillCenter
	{
		get
		{
			return false;
		}
		set
		{
		}
	}

	public bool applyGradient
	{
		get
		{
			return false;
		}
		set
		{
		}
	}

	public Color gradientTop
	{
		get
		{
			return default(Color);
		}
		set
		{
		}
	}

	public Color gradientBottom
	{
		get
		{
			return default(Color);
		}
		set
		{
		}
	}

	public override Vector4 border
	{
		get
		{
			return default(Vector4);
		}
	}

	protected override Vector4 padding
	{
		get
		{
			return default(Vector4);
		}
	}

	public override float pixelSize
	{
		get
		{
			return 0f;
		}
	}

	public override int minWidth
	{
		get
		{
			return 0;
		}
	}

	public override int minHeight
	{
		get
		{
			return 0;
		}
	}

	public override Vector4 drawingDimensions
	{
		get
		{
			return default(Vector4);
		}
	}

	public override bool premultipliedAlpha
	{
		get
		{
			return false;
		}
	}

	public UISpriteData GetAtlasSprite()
	{
		return null;
	}

	protected void SetAtlasSprite(UISpriteData sp)
	{
	}

	public override void MakePixelPerfect()
	{
	}

	protected override void OnInit()
	{
	}

	protected override void OnUpdate()
	{
	}

	public override void OnFill(List<Vector3> verts, List<Vector2> uvs, List<Color> cols)
	{
	}
}
