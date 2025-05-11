using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using System.Runtime.InteropServices;
using UnityEngine;

[ExecuteInEditMode]
public class UIPopupList : UIWidgetContainer
{
	[DoNotObfuscateNGUI]
	public enum Position
	{
		Auto = 0,
		Above = 1,
		Below = 2
	}

	[DoNotObfuscateNGUI]
	public enum Selection
	{
		OnPress = 0,
		OnClick = 1
	}

	[DoNotObfuscateNGUI]
	public enum OpenOn
	{
		ClickOrTap = 0,
		RightClick = 1,
		DoubleClick = 2,
		Manual = 3
	}

	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void LegacyEvent(string val);

	public static UIPopupList current;

	protected static GameObject mChild;

	protected static float mFadeOutComplete;

	private const float animSpeed = 0.15f;

	public UIAtlas atlas;

	public UIFont bitmapFont;

	public Font trueTypeFont;

	public int fontSize;

	public FontStyle fontStyle;

	public string backgroundSprite;

	public string highlightSprite;

	public Sprite background2DSprite;

	public Sprite highlight2DSprite;

	public Position position;

	public Selection selection;

	public NGUIText.Alignment alignment;

	public List<string> items;

	public List<object> itemData;

	public List<Action> itemCallbacks;

	public Vector2 padding;

	public Color textColor;

	public Color backgroundColor;

	public Color highlightColor;

	public bool isAnimated;

	public bool isLocalized;

	public UILabel.Modifier textModifier;

	public bool separatePanel;

	public int overlap;

	public OpenOn openOn;

	public List<EventDelegate> onChange;

	[HideInInspector]
	[SerializeField]
	protected string mSelectedItem;

	[HideInInspector]
	[SerializeField]
	protected UIPanel mPanel;

	[HideInInspector]
	[SerializeField]
	protected UIBasicSprite mBackground;

	[HideInInspector]
	[SerializeField]
	protected UIBasicSprite mHighlight;

	[HideInInspector]
	[SerializeField]
	protected UILabel mHighlightedLabel;

	[HideInInspector]
	[SerializeField]
	protected List<UILabel> mLabelList;

	[HideInInspector]
	[SerializeField]
	protected float mBgBorder;

	public bool keepValue;

	[NonSerialized]
	protected GameObject mSelection;

	[NonSerialized]
	protected int mOpenFrame;

	[HideInInspector]
	[SerializeField]
	private GameObject eventReceiver;

	[HideInInspector]
	[SerializeField]
	private string functionName;

	[HideInInspector]
	[SerializeField]
	private float textScale;

	[HideInInspector]
	[SerializeField]
	private UIFont font;

	[HideInInspector]
	[SerializeField]
	private UILabel textLabel;

	[NonSerialized]
	public Vector3 startingPosition;

	private LegacyEvent mLegacyEvent;

	[NonSerialized]
	protected bool mExecuting;

	protected bool mUseDynamicFont;

	[NonSerialized]
	protected bool mStarted;

	protected bool mTweening;

	public GameObject source;

	public UnityEngine.Object ambigiousFont
	{
		get
		{
			return null;
		}
		set
		{
		}
	}

	[Obsolete]
	public LegacyEvent onSelectionChange
	{
		get
		{
			return null;
		}
		set
		{
		}
	}

	public static bool isOpen
	{
		get
		{
			return false;
		}
	}

	public virtual string value
	{
		get
		{
			return null;
		}
		set
		{
		}
	}

	public virtual object data
	{
		get
		{
			return null;
		}
	}

	public Action callback
	{
		get
		{
			return null;
		}
	}

	public bool isColliderEnabled
	{
		get
		{
			return false;
		}
	}

	protected bool isValid
	{
		get
		{
			return false;
		}
	}

	protected int activeFontSize
	{
		get
		{
			return 0;
		}
	}

	protected float activeFontScale
	{
		get
		{
			return 0f;
		}
	}

	protected float fitScale
	{
		get
		{
			return 0f;
		}
	}

	public void Set(string value, bool notify = true)
	{
	}

	public virtual void Clear()
	{
	}

	public virtual void AddItem(string text)
	{
	}

	public virtual void AddItem(string text, Action del)
	{
	}

	public virtual void AddItem(string text, object data, Action del = null)
	{
	}

	public virtual void RemoveItem(string text)
	{
	}

	public virtual void RemoveItemByData(object data)
	{
	}

	protected void TriggerCallbacks()
	{
	}

	protected virtual void OnEnable()
	{
	}

	protected virtual void OnValidate()
	{
	}

	public virtual void Start()
	{
	}

	protected virtual void OnLocalize()
	{
	}

	protected virtual void Highlight(UILabel lbl, bool instant)
	{
	}

	protected virtual Vector3 GetHighlightPosition()
	{
		return default(Vector3);
	}

	[DebuggerHidden]
	protected virtual IEnumerator UpdateTweenPosition()
	{
		return null;
	}

	protected virtual void OnItemHover(GameObject go, bool isOver)
	{
	}

	protected virtual void OnItemPress(GameObject go, bool isPressed)
	{
	}

	protected virtual void OnItemClick(GameObject go)
	{
	}

	private void Select(UILabel lbl, bool instant)
	{
	}

	protected virtual void OnNavigate(KeyCode key)
	{
	}

	protected virtual void OnKey(KeyCode key)
	{
	}

	protected virtual void OnDisable()
	{
	}

	protected virtual void OnSelect(bool isSelected)
	{
	}

	public static void Close()
	{
	}

	public virtual void CloseSelf()
	{
	}

	protected virtual void AnimateColor(UIWidget widget)
	{
	}

	protected virtual void AnimatePosition(UIWidget widget, bool placeAbove, float bottom)
	{
	}

	protected virtual void AnimateScale(UIWidget widget, bool placeAbove, float bottom)
	{
	}

	protected void Animate(UIWidget widget, bool placeAbove, float bottom)
	{
	}

	protected virtual void OnClick()
	{
	}

	protected virtual void OnDoubleClick()
	{
	}

	[DebuggerHidden]
	private IEnumerator CloseIfUnselected()
	{
		return null;
	}

	public virtual void Show()
	{
	}
}
