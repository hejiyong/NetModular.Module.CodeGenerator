﻿using System.IO;
using System.Linq;
using NetModular.Module.CodeGenerator.Infrastructure.Templates.Models;

namespace NetModular.Module.CodeGenerator.Infrastructure.Templates.Default.T4.src.Library.Domain
{
    public partial class Repository : ITemplateHandler
    {
        private readonly TemplateBuildModel _model;
        private readonly string _prefix;
        private ClassBuildModel _class;

        public Repository(TemplateBuildModel model)
        {
            _model = model;
            _prefix = model.Project.Prefix;
        }

        public void Save()
        {
            if (_model.Project.ClassList != null && _model.Project.ClassList.Any())
            {
                foreach (var classModel in _model.Project.ClassList)
                {
                    _class = classModel;

                    var dir = Path.Combine(_model.RootPath, _model.Project.Code, "src/Library/Domain", _class.Name);
                    if (!Directory.Exists(dir))
                        Directory.CreateDirectory(dir);

                    //清空
                    GenerationEnvironment.Clear();

                    var content = TransformText();

                    var filePath = Path.Combine(dir, $"I{_class.Name}Repository.cs");
                    File.WriteAllText(filePath, content);
                }
            }
        }
    }
}
