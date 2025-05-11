using UnityEngine;

namespace DragonBones
{
	[DisallowMultipleComponent]
	public class DragonBoneEventDispatcher : UnityEventDispatcher<EventObject>, IEventDispatcher<EventObject>
	{
		public void AddDBEventListener(string type, ListenerDelegate<EventObject> listener)
		{
		}

		public void DispatchDBEvent(string type, EventObject eventObject)
		{
		}

		public bool HasDBEventListener(string type)
		{
			return false;
		}

		public void RemoveDBEventListener(string type, ListenerDelegate<EventObject> listener)
		{
		}
	}
}
