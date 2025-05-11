using UnityEngine;
using UnityEngine.Playables;
using UnityEngine.Timeline;

namespace Spine.Unity.Playables
{
	public class SpineSkeletonFlipTrack : TrackAsset
	{
		public override Playable CreateTrackMixer(PlayableGraph graph, GameObject go, int inputCount)
		{
			return default(Playable);
		}

		public override void GatherProperties(PlayableDirector director, IPropertyCollector driver)
		{
		}
	}
}
