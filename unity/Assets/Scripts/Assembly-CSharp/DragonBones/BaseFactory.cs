using System;
using System.Collections.Generic;

namespace DragonBones
{
	public abstract class BaseFactory
	{
		protected static ObjectDataParser _objectParser;

		protected static BinaryDataParser _binaryParser;

		public bool autoSearch;

		protected readonly Dictionary<string, DragonBonesData> _dragonBonesDataMap;

		protected readonly Dictionary<string, List<TextureAtlasData>> _textureAtlasDataMap;

		public DragonBones _dragonBones;

		protected DataParser _dataParser;

		public WorldClock clock
		{
			get
			{
				return null;
			}
		}

		public BaseFactory(DataParser dataParser = null)
		{
		}

		protected bool _IsSupportMesh()
		{
			return false;
		}

		protected TextureData _GetTextureData(string textureAtlasName, string textureName)
		{
			return null;
		}

		protected bool _FillBuildArmaturePackage(BuildArmaturePackage dataPackage, string dragonBonesName, string armatureName, string skinName, string textureAtlasName)
		{
			return false;
		}

		protected void _BuildBones(BuildArmaturePackage dataPackage, Armature armature)
		{
		}

		protected void _BuildSlots(BuildArmaturePackage dataPackage, Armature armature)
		{
		}

		protected void _BuildConstraints(BuildArmaturePackage dataPackage, Armature armature)
		{
		}

		protected virtual Armature _BuildChildArmature(BuildArmaturePackage dataPackage, Slot slot, DisplayData displayData)
		{
			return null;
		}

		protected object _GetSlotDisplay(BuildArmaturePackage dataPackage, DisplayData displayData, DisplayData rawDisplayData, Slot slot)
		{
			return null;
		}

		protected abstract TextureAtlasData _BuildTextureAtlasData(TextureAtlasData textureAtlasData, object textureAtlas);

		protected abstract Armature _BuildArmature(BuildArmaturePackage dataPackage);

		protected abstract Slot _BuildSlot(BuildArmaturePackage dataPackage, SlotData slotData, Armature armature);

		public DragonBonesData ParseDragonBonesData(object rawData, string name = null, float scale = 1f)
		{
			return null;
		}

		public TextureAtlasData ParseTextureAtlasData(Dictionary<string, object> rawData, object textureAtlas, string name = null, float scale = 1f)
		{
			return null;
		}

		public void UpdateTextureAtlasData(string name, List<object> textureAtlases)
		{
		}

		public DragonBonesData GetDragonBonesData(string name)
		{
			return null;
		}

		public void AddDragonBonesData(DragonBonesData data, string name = null)
		{
		}

		public virtual void RemoveDragonBonesData(string name, bool disposeData = true)
		{
		}

		public List<TextureAtlasData> GetTextureAtlasData(string name)
		{
			return null;
		}

		public void AddTextureAtlasData(TextureAtlasData data, string name = null)
		{
		}

		public virtual void RemoveTextureAtlasData(string name, bool disposeData = true)
		{
		}

		public virtual ArmatureData GetArmatureData(string name, string dragonBonesName = "")
		{
			return null;
		}

		public virtual void Clear(bool disposeData = true)
		{
		}

		public virtual Armature BuildArmature(string armatureName, string dragonBonesName = "", string skinName = null, string textureAtlasName = null)
		{
			return null;
		}

		public virtual void ReplaceDisplay(Slot slot, DisplayData displayData, int displayIndex = -1)
		{
		}

		public bool ReplaceSlotDisplay(string dragonBonesName, string armatureName, string slotName, string displayName, Slot slot, int displayIndex = -1)
		{
			return false;
		}

		public bool ReplaceSlotDisplayList(string dragonBonesName, string armatureName, string slotName, Slot slot)
		{
			return false;
		}

		public bool ReplaceSkin(Armature armature, SkinData skin, bool isOverride = false, List<string> exclude = null)
		{
			return false;
		}

		public bool ReplaceAnimation(Armature armature, ArmatureData armatureData, bool isOverride = true)
		{
			return false;
		}

		public Dictionary<string, DragonBonesData> GetAllDragonBonesData()
		{
			return null;
		}

		public Dictionary<string, List<TextureAtlasData>> GetAllTextureAtlasData()
		{
			return null;
		}

		[Obsolete]
		public bool ChangeSkin(Armature armature, SkinData skin, List<string> exclude = null)
		{
			return false;
		}
	}
}
