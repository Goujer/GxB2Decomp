using UnityEngine;

public class UIButtonScale : MonoBehaviour
{
	public Transform tweenTarget;

	public Vector3 hover;

	public Vector3 pressed;

	public float[] durations;

	private bool mPressed;

	private int upCount;

	public float[] upScale;

	public AnimationCurve down;

	public AnimationCurve up;

	private Vector3 mScale;

	private bool mStarted;

	private UIWidget mUIWidget;

	private bool isAutoResizeBoxCollider;

	private BoxCollider mBoxCollider;

	private Vector3 mBoxColliderSize;

	private void Start()
	{
	}

	private void OnEnable()
	{
	}

	private void OnDisable()
	{
	}

	private void PlayNext()
	{
	}

	private void ResumeCollider()
	{
	}

	private void OnPress(bool isPressed)
	{
	}

	private void OnHover(bool isOver)
	{
	}

	private void OnSelect(bool isSelected)
	{
	}
}
