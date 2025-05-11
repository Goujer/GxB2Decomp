namespace Spine
{
	public class Event
	{
		internal readonly EventData data;

		internal readonly float time;

		internal int intValue;

		internal float floatValue;

		internal string stringValue;

		public EventData Data
		{
			get
			{
				return null;
			}
		}

		public float Time
		{
			get
			{
				return 0f;
			}
		}

		public int Int
		{
			get
			{
				return 0;
			}
			set
			{
			}
		}

		public float Float
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		public string String
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		public Event(float time, EventData data)
		{
		}

		public override string ToString()
		{
			return null;
		}
	}
}
