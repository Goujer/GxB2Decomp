using System;
using UnityEngine;
using UnityEngine.Playables;
using UnityEngine.Timeline;

namespace Spine.Unity.Playables
{
	[Serializable]
	public class SpineAnimationStateClip : PlayableAsset, ITimelineClipAsset
	{
		public SpineAnimationStateBehaviour template;

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
}
