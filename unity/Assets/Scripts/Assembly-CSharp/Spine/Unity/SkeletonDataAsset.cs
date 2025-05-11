using UnityEngine;

namespace Spine.Unity
{
	public class SkeletonDataAsset : ScriptableObject
	{
		public AtlasAsset[] atlasAssets;

		public float scale;

		public TextAsset skeletonJSON;

		public string[] fromAnimation;

		public string[] toAnimation;

		public float[] duration;

		public float defaultMix;

		public RuntimeAnimatorController controller;

		private SkeletonData skeletonData;

		private AnimationStateData stateData;

		public bool IsLoaded
		{
			get
			{
				return false;
			}
		}

		private void Reset()
		{
		}

		public static SkeletonDataAsset CreateRuntimeInstance(TextAsset skeletonDataFile, AtlasAsset atlasAsset, bool initialize, float scale = 0.01f)
		{
			return null;
		}

		public static SkeletonDataAsset CreateRuntimeInstance(TextAsset skeletonDataFile, AtlasAsset[] atlasAssets, bool initialize, float scale = 0.01f)
		{
			return null;
		}

		public void Clear()
		{
		}

		public SkeletonData GetSkeletonData(bool quiet)
		{
			return null;
		}

		internal void InitializeWithData(SkeletonData sd)
		{
		}

		internal Atlas[] GetAtlasArray()
		{
			return null;
		}

		internal static SkeletonData ReadSkeletonData(byte[] bytes, AttachmentLoader attachmentLoader, float scale)
		{
			return null;
		}

		internal static SkeletonData ReadSkeletonData(string text, AttachmentLoader attachmentLoader, float scale)
		{
			return null;
		}

		public void FillStateData()
		{
		}

		public AnimationStateData GetAnimationStateData()
		{
			return null;
		}
	}
}
