using System.Collections.Generic;
using UnityEngine;

namespace DragonBones
{
	public class UnityFactory : BaseFactory
	{
		internal const string defaultShaderName = "Sprites/Default";

		internal const string defaultUIShaderName = "UI/Default";

		internal static DragonBones _dragonBonesInstance;

		private static UnityFactory _factory;

		private static GameObject _gameObject;

		private GameObject _armatureGameObject;

		private bool _isUGUI;

		private readonly List<UnityDragonBonesData> _cacheUnityDragonBonesData;

		public static UnityFactory factory
		{
			get
			{
				return null;
			}
		}

		public IEventDispatcher<EventObject> soundEventManager
		{
			get
			{
				return null;
			}
		}

		public UnityFactory(DataParser dataParser = null)
		{
		}

		private void Init()
		{
		}

		protected override TextureAtlasData _BuildTextureAtlasData(TextureAtlasData textureAtlasData, object textureAtlas)
		{
			return null;
		}

		protected override Armature _BuildArmature(BuildArmaturePackage dataPackage)
		{
			return null;
		}

		protected override Armature _BuildChildArmature(BuildArmaturePackage dataPackage, Slot slot, DisplayData displayData)
		{
			return null;
		}

		protected override Slot _BuildSlot(BuildArmaturePackage dataPackage, SlotData slotData, Armature armature)
		{
			return null;
		}

		public UnityArmatureComponent BuildArmatureComponent(string armatureName, string dragonBonesName = "", string skinName = "", string textureAtlasName = "", GameObject gameObject = null, bool isUGUI = false)
		{
			return null;
		}

		public GameObject GetTextureDisplay(string textureName, string textureAtlasName = null)
		{
			return null;
		}

		protected void _RefreshTextureAtlas(UnityTextureAtlasData textureAtlasData, bool isUGUI, bool isEditor = false)
		{
		}

		public override void Clear(bool disposeData = true)
		{
		}

		public DragonBonesData LoadData(UnityDragonBonesData data, bool isUGUI = false, float armatureScale = 0.01f, float texScale = 1f)
		{
			return null;
		}

		public DragonBonesData LoadDragonBonesData(string dragonBonesJSONPath, string name = "", float scale = 0.01f)
		{
			return null;
		}

		public DragonBonesData LoadDragonBonesData(TextAsset dragonBonesJSON, string name = "", float scale = 0.01f)
		{
			return null;
		}

		public UnityTextureAtlasData LoadTextureAtlasData(string textureAtlasJSONPath, string name = "", float scale = 1f, bool isUGUI = false)
		{
			return null;
		}

		public UnityTextureAtlasData LoadTextureAtlasData(UnityDragonBonesData.TextureAtlas textureAtlas, string name, float scale = 1f, bool isUGUI = false)
		{
			return null;
		}

		public void RefreshAllTextureAtlas(UnityArmatureComponent unityArmature)
		{
		}

		public override void ReplaceDisplay(Slot slot, DisplayData displayData, int displayIndex = -1)
		{
		}

		public void ReplaceSlotDisplay(string dragonBonesName, string armatureName, string slotName, string displayName, Slot slot, Texture2D texture, Material material = null, bool isUGUI = false, int displayIndex = -1)
		{
		}

		public UnityDragonBonesData GetCacheUnityDragonBonesData(string draonBonesName)
		{
			return null;
		}

		public void AddCacheUnityDragonBonesData(UnityDragonBonesData unityData)
		{
		}
	}
}
