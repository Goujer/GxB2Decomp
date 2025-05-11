using UnityEngine.Playables;

namespace Spine.Unity.Playables
{
	public class SpineSkeletonFlipMixerBehaviour : PlayableBehaviour
	{
		private bool defaultFlipX;

		private bool defaultFlipY;

		private SpinePlayableHandleBase playableHandle;

		private bool m_FirstFrameHappened;

		public override void ProcessFrame(Playable playable, FrameData info, object playerData)
		{
		}

		public override void OnGraphStop(Playable playable)
		{
		}
	}
}
