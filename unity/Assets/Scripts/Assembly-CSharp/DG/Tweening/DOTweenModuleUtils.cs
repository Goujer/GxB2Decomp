using DG.Tweening.Core;
using DG.Tweening.Plugins.Core.PathCore;
using DG.Tweening.Plugins.Options;
using UnityEngine;

namespace DG.Tweening
{
	public static class DOTweenModuleUtils
	{
		public static class Physics
		{
			public static void SetOrientationOnPath(PathOptions options, Tween t, Quaternion newRot, Transform trans)
			{
			}

			public static bool HasRigidbody2D(Component target)
			{
				return false;
			}

			public static bool HasRigidbody(Component target)
			{
				return false;
			}

			public static TweenerCore<Vector3, Path, PathOptions> CreateDOTweenPathTween(MonoBehaviour target, bool tweenRigidbody, bool isLocal, Path path, float duration, PathMode pathMode)
			{
				return null;
			}
		}

		private static bool _initialized;

		public static void Init()
		{
		}
	}
}
