using System.Runtime.InteropServices;
using UnityEngine;

public class NGUIDemo : MonoBehaviour
{
	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void OnLinkClick(string str);

	public OnLinkClick onLinkClick;

	private NGUIHTML html;

	private bool updateTime;

	public void Awake()
	{
	}

	public void FixedUpdate()
	{
	}

	internal void onLinkClicked(GameObject senderGo)
	{
	}

	public NGUIHTML getNguiHtml()
	{
		return null;
	}
}
