using UnityEngine;

public class UIPlaySound : MonoBehaviour
{
	[DoNotObfuscateNGUI]
	public enum Trigger
	{
		OnClick = 0,
		OnMouseOver = 1,
		OnMouseOut = 2,
		OnPress = 3,
		OnRelease = 4,
		Custom = 5,
		OnEnable = 6,
		OnDisable = 7
	}

	public AudioClip audioClip;

	public Trigger trigger;

	public int tableId;

	public float volume;

	public float pitch;

	private bool mIsOver;

	private bool canPlay
	{
		get
		{
			return false;
		}
	}

	private void tryPlaySound()
	{
	}

	private void OnEnable()
	{
	}

	private void OnDisable()
	{
	}

	private void OnHover(bool isOver)
	{
	}

	private void OnPress(bool isPressed)
	{
	}

	private void OnClick()
	{
	}

	private void OnSelect(bool isSelected)
	{
	}

	public void Play()
	{
	}
}
