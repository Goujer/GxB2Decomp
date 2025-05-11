using System;
using UnityEngine;

public class UIButtonOffset : MonoBehaviour
{
	public Transform tweenTarget;

	public Vector3 hover;

	public Vector3 pressed;

	public float duration;

	[NonSerialized]
	private Vector3 mPos;

	[NonSerialized]
	private bool mStarted;

	[NonSerialized]
	private bool mPressed;

	private void Start()
	{
	}

	private void OnEnable()
	{
	}

	private void OnDisable()
	{
	}

	private void OnPress(bool isPressed)
	{
	}

	private void OnHover(bool isOver)
	{
	}

	private void OnDragOver()
	{
	}

	private void OnDragOut()
	{
	}

	private void OnSelect(bool isSelected)
	{
	}
}
