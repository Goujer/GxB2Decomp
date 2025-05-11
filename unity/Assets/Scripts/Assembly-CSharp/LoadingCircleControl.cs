using UnityEngine;

public class LoadingCircleControl : MonoBehaviour
{
	public float DEFAULT_LONG_PRESS_TIME;

	private Material LoadingCircel;

	private GameObject Effect;

	private float TimeCount;

	private bool IsFirstTime;

	private void Start()
	{
	}

	public bool OnPressed()
	{
		return false;
	}

	public void ShowLoadingCircle()
	{
	}

	public void HideLoadingCircle()
	{
	}

	public void dispose()
	{
	}
}
