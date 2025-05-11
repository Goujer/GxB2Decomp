using System;
using UnityEngine;
using UnityEngine.Playables;
using UnityEngine.Timeline;

[Serializable]
public class SpineSkeletonFlipClip : PlayableAsset, ITimelineClipAsset
{
	public SpineSkeletonFlipBehaviour template;

	public ClipCaps clipCaps
	{
		get
		{
			return default(ClipCaps);
		}
	}

	public override Playable CreatePlayable(PlayableGraph graph, GameObject owner)
	{
		return default(Playable);
	}
}
