using UnityEngine;

namespace Spine.Unity.Playables
{
	public abstract class SpinePlayableHandleBase : MonoBehaviour
	{
		public abstract SkeletonData SkeletonData { get; }

		public abstract Skeleton Skeleton { get; }

		public event SpineEventDelegate AnimationEvents
		{
			add
			{
			}
			remove
			{
			}
		}

		public virtual void HandleEvents(ExposedList<Event> eventBuffer)
		{
		}
	}
}
