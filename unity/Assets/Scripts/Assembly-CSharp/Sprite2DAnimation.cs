using System.Collections.Generic;
using UnityEngine;

public class Sprite2DAnimation : MonoBehaviour
{
	public string atlas;

	public string[] sprites;

	public int frame;

	public bool flip;

	public bool loop;

	public Dictionary<int, string> frame2Event;
}
