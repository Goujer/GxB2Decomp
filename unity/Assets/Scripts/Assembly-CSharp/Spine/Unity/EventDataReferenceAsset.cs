using UnityEngine;

namespace Spine.Unity
{
	[CreateAssetMenu]
	public class EventDataReferenceAsset : ScriptableObject
	{
		private const bool QuietSkeletonData = true;

		[SerializeField]
		protected SkeletonDataAsset skeletonDataAsset;

		[SerializeField]
		protected string eventName;

		private EventData eventData;

		public EventData EventData
		{
			get
			{
				return null;
			}
		}

		public void Initialize()
		{
		}

		public static implicit operator EventData(EventDataReferenceAsset asset)
		{
			return null;
		}
	}
}
