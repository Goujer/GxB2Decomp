using UnityEngine;

namespace DG.Tweening
{
	public static class DOTweenModulePhysics2D
	{
		public static Tweener DOMove(this Rigidbody2D target, Vector2 endValue, float duration, bool snapping = false)
		{
			return null;
		}

		public static Tweener DOMoveX(this Rigidbody2D target, float endValue, float duration, bool snapping = false)
		{
			return null;
		}

		public static Tweener DOMoveY(this Rigidbody2D target, float endValue, float duration, bool snapping = false)
		{
			return null;
		}

		public static Tweener DORotate(this Rigidbody2D target, float endValue, float duration)
		{
			return null;
		}

		public static Sequence DOJump(this Rigidbody2D target, Vector2 endValue, float jumpPower, int numJumps, float duration, bool snapping = false)
		{
			return null;
		}
	}
}
