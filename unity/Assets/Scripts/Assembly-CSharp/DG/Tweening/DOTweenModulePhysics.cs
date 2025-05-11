using DG.Tweening.Core;
using DG.Tweening.Plugins.Core.PathCore;
using DG.Tweening.Plugins.Options;
using UnityEngine;

namespace DG.Tweening
{
	public static class DOTweenModulePhysics
	{
		public static Tweener DOMove(this Rigidbody target, Vector3 endValue, float duration, bool snapping = false)
		{
			return null;
		}

		public static Tweener DOMoveX(this Rigidbody target, float endValue, float duration, bool snapping = false)
		{
			return null;
		}

		public static Tweener DOMoveY(this Rigidbody target, float endValue, float duration, bool snapping = false)
		{
			return null;
		}

		public static Tweener DOMoveZ(this Rigidbody target, float endValue, float duration, bool snapping = false)
		{
			return null;
		}

		public static Tweener DORotate(this Rigidbody target, Vector3 endValue, float duration, RotateMode mode = RotateMode.Fast)
		{
			return null;
		}

		public static Tweener DOLookAt(this Rigidbody target, Vector3 towards, float duration, AxisConstraint axisConstraint = AxisConstraint.None, Vector3? up = null)
		{
			return null;
		}

		public static Sequence DOJump(this Rigidbody target, Vector3 endValue, float jumpPower, int numJumps, float duration, bool snapping = false)
		{
			return null;
		}

		public static TweenerCore<Vector3, Path, PathOptions> DOPath(this Rigidbody target, Vector3[] path, float duration, PathType pathType = PathType.Linear, PathMode pathMode = PathMode.Full3D, int resolution = 10, Color? gizmoColor = null)
		{
			return null;
		}

		public static TweenerCore<Vector3, Path, PathOptions> DOLocalPath(this Rigidbody target, Vector3[] path, float duration, PathType pathType = PathType.Linear, PathMode pathMode = PathMode.Full3D, int resolution = 10, Color? gizmoColor = null)
		{
			return null;
		}

		internal static TweenerCore<Vector3, Path, PathOptions> DOPath(this Rigidbody target, Path path, float duration, PathMode pathMode = PathMode.Full3D)
		{
			return null;
		}

		internal static TweenerCore<Vector3, Path, PathOptions> DOLocalPath(this Rigidbody target, Path path, float duration, PathMode pathMode = PathMode.Full3D)
		{
			return null;
		}
	}
}
