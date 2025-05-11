using System.Collections.Generic;

namespace DragonBones
{
	public class DragonBones
	{
		public static bool yDown;

		public static bool debug;

		public static bool debugDraw;

		public static readonly string VERSION;

		private readonly WorldClock _clock;

		private readonly List<EventObject> _events;

		private readonly List<BaseObject> _objects;

		private IEventDispatcher<EventObject> _eventManager;

		public WorldClock clock
		{
			get
			{
				return null;
			}
		}

		public IEventDispatcher<EventObject> eventManager
		{
			get
			{
				return null;
			}
		}

		public DragonBones(IEventDispatcher<EventObject> eventManager)
		{
		}

		public void AdvanceTime(float passedTime)
		{
		}

		public void BufferEvent(EventObject value)
		{
		}

		public void BufferObject(BaseObject value)
		{
		}

		public static implicit operator bool(DragonBones exists)
		{
			return false;
		}
	}
}
