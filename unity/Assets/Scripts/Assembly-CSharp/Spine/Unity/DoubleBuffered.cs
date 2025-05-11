namespace Spine.Unity
{
	public class DoubleBuffered<T> where T : new()
	{
		private readonly T a;

		private readonly T b;

		private bool usingA;

		public T GetCurrent()
		{
			return default(T);
		}

		public T GetNext()
		{
			return default(T);
		}
	}
}
