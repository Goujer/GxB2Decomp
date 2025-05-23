using System;
using System.Collections.Generic;
using AnimationOrTween;
using UnityEngine;

public abstract class UITweener : MonoBehaviour
{
	[DoNotObfuscateNGUI]
	public enum Method
	{
		Linear = 0,
		EaseIn = 1,
		EaseOut = 2,
		EaseInOut = 3,
		BounceIn = 4,
		BounceOut = 5
	}

	[DoNotObfuscateNGUI]
	public enum Style
	{
		Once = 0,
		Loop = 1,
		PingPong = 2
	}

	public static UITweener current;

	[HideInInspector]
	public Method method;

	[HideInInspector]
	public Style style;

	[HideInInspector]
	public AnimationCurve animationCurve;

	[HideInInspector]
	public bool ignoreTimeScale;

	[HideInInspector]
	public float delay;

	[HideInInspector]
	public float duration;

	[HideInInspector]
	public bool steeperCurves;

	[HideInInspector]
	public int tweenGroup;

	public bool useFixedUpdate;

	[HideInInspector]
	public List<EventDelegate> onFinished;

	[HideInInspector]
	public GameObject eventReceiver;

	[HideInInspector]
	public string callWhenFinished;

	[NonSerialized]
	public float timeScale;

	private bool mStarted;

	private float mStartTime;

	private float mDuration;

	private float mAmountPerDelta;

	private float mFactor;

	private List<EventDelegate> mTemp;

	public float amountPerDelta
	{
		get
		{
			return 0f;
		}
	}

	public float tweenFactor
	{
		get
		{
			return 0f;
		}
		set
		{
		}
	}

	public Direction direction
	{
		get
		{
			return default(Direction);
		}
	}

	private void Reset()
	{
	}

	protected virtual void Start()
	{
	}

	protected void Update()
	{
	}

	protected void FixedUpdate()
	{
	}

	protected void DoUpdate()
	{
	}

	public void SetOnFinished(EventDelegate.Callback del)
	{
	}

	public void SetOnFinished(EventDelegate del)
	{
	}

	public void AddOnFinished(EventDelegate.Callback del)
	{
	}

	public void AddOnFinished(EventDelegate del)
	{
	}

	public void RemoveOnFinished(EventDelegate del)
	{
	}

	private void OnDisable()
	{
	}

	public void Sample(float factor, bool isFinished)
	{
	}

	private float BounceLogic(float val)
	{
		return 0f;
	}

	[Obsolete]
	public void Play()
	{
	}

	public void PlayForward()
	{
	}

	public void PlayReverse()
	{
	}

	public virtual void Play(bool forward)
	{
	}

	public void ResetToBeginning()
	{
	}

	public void Toggle()
	{
	}

	protected abstract void OnUpdate(float factor, bool isFinished);

	public static T Begin<T>(GameObject go, float duration, float delay = 0f) where T : UITweener
	{
		return null;
	}

	public virtual void SetStartToCurrentValue()
	{
	}

	public virtual void SetEndToCurrentValue()
	{
	}

	protected virtual void OnDestroy()
	{
	}
}
