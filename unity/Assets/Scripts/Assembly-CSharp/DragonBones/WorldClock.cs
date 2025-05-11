using System;
using System.Collections.Generic;

namespace DragonBones
{
	public class WorldClock : IAnimatable
	{
		public float time;

		public float timeScale;

		private float _systemTime;

		private readonly List<IAnimatable> _animatebles;

		private WorldClock _clock;

		[Obsolete]
		public WorldClock clock
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		public WorldClock(float time = -1f)
		{
		}

		public void AdvanceTime(float passedTime)
		{
		}

		public bool Contains(IAnimatable value)
		{
			return false;
		}

		public void Add(IAnimatable value)
		{
		}

		public void Remove(IAnimatable value)
		{
		}

		public void Clear()
		{
		}
	}
}
